from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from app.core.config import settings

from sqlalchemy.orm import DeclarativeBase


class Base(DeclarativeBase):
    pass


from app.models.document import Document

engine = create_engine(
    settings.database_url,
    echo=False
)

SessionLocal = sessionmaker(
    autocommit=False,
    autoflush=False,
    bind=engine
)


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()