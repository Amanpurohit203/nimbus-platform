from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from app.db.database import get_db
from app.schemas.document import DocumentCreate, DocumentResponse
from app.crud.document import create_document
from fastapi import UploadFile, File

router = APIRouter(
    prefix="/documents",
    tags=["Documents"]
)


@router.post("/", response_model=DocumentResponse)
def create_document_api(
    document: DocumentCreate,
    db: Session = Depends(get_db)
):
    return create_document(db, document)

@router.post("/upload")
def upload_document(
    file: UploadFile = File(...),
):
    return {
        "filename": file.filename,
        "content_type": file.content_type,
    }    