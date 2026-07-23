from sqlalchemy.orm import Session

from app.models.document import Document
from app.schemas.document import DocumentCreate


def create_document(db: Session, document: DocumentCreate) -> Document:
    db_document = Document(
        file_name=document.file_name,
        file_type=document.file_type,
    )

    db.add(db_document)
    db.commit()
    db.refresh(db_document)

    return db_document