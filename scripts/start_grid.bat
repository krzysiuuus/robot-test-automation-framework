@echo off
cd /d "%~dp0.."
docker compose -f docker-compose-grid.yml up -d
pause