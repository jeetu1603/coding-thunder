from flask import Flask, render_template, request, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail
import os
from werkzeug.utils import secure_filename
import math


with open('config.json', 'r') as f:
    params = json.load(f)["params"]

local_server = params['local_server']


app = Flask(__name__)
app.secret_key = 'super-secret-key'

app.config['UPLOAD_FOLDER'] = params['upload_location']

app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = 'True',
    MAIL_USERNAME = params['gmail_id'],
    MAIL_PASSWORD = params['gmail_pass']
    )
mail = Mail(app)

if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
db = SQLAlchemy(app)

class Contacts(db.Model):
    '''sno, name, email, phone, msg, date'''
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30), nullable=False)
    email = db.Column(db.String(30), unique=True, nullable=False)
    phone = db.Column(db.String(15), nullable=False)
    msg = db.Column(db.Text, nullable=False)
    date = db.Column(db.String(50), nullable=False, default=datetime.now())

class Posts(db.Model):
    '''sno, title, tagline, slug, post, date, img'''
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False)
    tagline = db.Column(db.String(50), nullable=False)
    slug = db.Column(db.String(25), unique=True, nullable=False)
    post = db.Column(db.Text, nullable=False)
    date = db.Column(db.String(50), nullable=False, default=datetime.now())
    img_file = db.Column(db.String(30), nullable=True)

@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    # calculating total no of pages 
    last = math.ceil(len(posts)/params['no_of_posts'])
    page = request.args.get('page')

    if(not str(page).isnumeric()):
        page = 1

    page = int(page)

    posts = posts[(page-1)*params['no_of_posts']:(page-1)*params['no_of_posts']+params['no_of_posts']]

    if page==1:
        prev = "#"
        next = "/?page="+str(page+1)
    elif page==last:
        prev = "/?page="+str(page-1)
        next = "#"
    else:
        prev = "/?page="+str(page-1)
        next = "/?page="+str(page+1)
    
    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)

@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if "user" in session and session['user'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == "POST":
        # redirect to admin portal
        username = request.form.get('uname')
        userpass = request.form.get('upass')
        if username == params['admin_user'] and userpass == params['admin_pass']:
            # set the session variable
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
        else:
            return render_template('login.html', params=params)
    else:
        return render_template('login.html', params=params)

@app.route("/uploader", methods=['GET', 'POST'])
def uploader():
    if "user" in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded Successfully"

@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if "user" in session and session['user']==params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect("/dashboard")

@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if "user" in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('post')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno=='0':
                post = Posts(title=box_title, tagline=tline, slug=slug, post=content, date=date, img_file=img_file)
                db.session.add(post)
                db.session.commit()

            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.tagline = tline
                post.slug = slug
                post.post = content
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/' + sno)

        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, sno=sno, post=post)
    else:
        return render_template('login.html', params=params)

@app.route("/about")
def about():
    return render_template('about.html', params=params)

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)

@app.route("/contact", methods=["GET","POST"])
def contact():
    if request.method == 'POST':
        ''' fetch data and add it to the database '''
        '''sno, name, email, phone, msg, date'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        msg = request.form.get('message')
        entry = Contacts(name=name, email=email, phone=phone, msg=msg)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                            sender = email,
                            recipients = [params['gmail_id']],
                            body = msg + '\n' + phone)
        flash("Thanks for submitting your details. we will get back to you soon.", "success")                    
    return render_template('contact.html', params=params)

app.run(debug=True)