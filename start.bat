cd notes/

echo "Installing Node-Modules"
npm install

echo "Starting server"
npm start

@REM For SSH Use
@REM npm run start -- --host 0.0.0.0