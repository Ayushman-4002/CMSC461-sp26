# utils.py
import os
from pathlib import Path
from functools import wraps
from flask import session, flash, redirect, url_for
import mysql.connector
from dotenv import load_dotenv


load_dotenv(Path(__file__).resolve().parent / ".env")

def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "127.0.0.1"),
        user=os.getenv("DB_USER", ""),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_NAME", ""),
        port=int(os.getenv("DB_PORT") or 3306)
    )

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            flash("You need to be logged in to view this page.", "error")
            # Note the "auth." prefix! We'll explain this in Step 4.
            return redirect(url_for('auth.login')) 
        return f(*args, **kwargs)
    return decorated_function
