from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class System(db.Model):

    __tablename__ = "systems"

    id = db.Column(db.Integer, primary_key=True)

    system_name = db.Column(db.String(100))

    system_type = db.Column(db.String(100))

    description = db.Column(db.Text)

    ip_address = db.Column(db.String(45))

    port = db.Column(db.Integer)

    protocol = db.Column(db.String(20))

    status = db.Column(db.String(20))