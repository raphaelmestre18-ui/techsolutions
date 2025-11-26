cd Documents\xampp\htdocs\techsolutions\BDD
mysqldump -uroot techsolutions>techsolutions.sql
cd Documents\xampp\htdocs\techsolutions
git add .
git commit -m "ajout de la sauvegarde.txt"
git push origin main 
pause
