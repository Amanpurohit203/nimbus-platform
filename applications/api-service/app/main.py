from fastapi import FastAPI
from app.api.root import router as root_router
from app.api.health import router as health_router
from app.core.config import settings
from app.core.logger import logger
from app.api.document import router as document_router
app = FastAPI(
    title=settings.app_name,
    app_description=settings.app_description,
    version=settings.app_version
)
logger.info("nimbus-api-service starting up...")
app.include_router(root_router)
app.include_router(health_router)   
app.include_router(document_router)
