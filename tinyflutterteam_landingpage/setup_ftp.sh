# FTP
docker run -d -v /home/admin/ftp:/home/vsftpd \
-p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
-e FTP_USER=admin -e FTP_PASS=admin@123 \
-e PASV_ADDRESS=127.0.0.1 -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 \
--name vsftpd --restart=always fauria/vsftpd




# Manually add a new FTP user to an existing container:
docker exec -i -t vsftpd bash
mkdir /home/vsftpd/myuser
echo -e "myuser\nmypass" >> /etc/vsftpd/virtual_users.txt
/usr/bin/db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db
exit
docker restart vsftpd