#! /bin/bash

sudo yum update

user_name="kar"
user_password="kartheek"
sudo useradd -m $user_name
echo $user_password | sudo passwd $user_name --stdin
echo "$user_name ALL=(ALL) ALL" >> /etc/sudoers


public_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDcyN95uDiChZrkb7eb5Fb9bUR7ciF8IjID5X3IrYLiCHIk00jByw7qDB1qPNK9/ENrZz/5rq8vaMo1UCxWKxChWG7lrKw6IWG6+YTUt8ieOFSymERvi8t0lY0VYBOXeeDwvHA5N4pAStrTHRFtOuWM6qfFd2zLN/DS+xjOOOugRDbD2qIeeHDfGLLjHHSYbK+yJECikc0vSdfJDC14H2BKwUtikjW9i5B6pae7nXXyzqRfSBHSaWsbw3SGmPERGo6bqrwyIfujSzKnv1Omg9lpUO4BQj9gh2zDUEAoVdGD2oVqewDtJ/dN27vVHRfD3bci/Ijp4ytXwGi/evDIlzTghZ/lRngfnbQW2D+69wN1HFAraxt0ZZ6VW5c1e18qBWELauApiErL8MgnAmiMgWxnumH+cDVda3MXu7VyRpeM3Ru4MdnyR9PJZ0p9cTTQ/YE+EVgderqs8GWBUnI4Fa9UpNau2iEUWZsYq1BlYnfkJNzNG3nKhEVKYgGksAtwbn5sjXAit6FgOdmQcyyqRTG3YdXZZ9Y4++EdPBAVAwrLp1mKqd0UixaNK7/PAg+8TyF84hDrCcysxu5546m0RlD9Exsg5BkfWB0wxwAs04gZ7PrEc/la5YQxL/BCR6VDkCANFIcQVwd0vudGkQR/6CixX4SJymAx1C5969IR3YCmfQ== kartheek@vivobook"

su $user_name -c "mkdir /home/$user_name/.ssh"
su $user_name -c "chmod 700 /home/$user_name/.ssh"
su $user_name -c "touch /home/$user_name/.ssh/authorized_keys"
su $user_name -c "chmod 600 /home/$user_name/.ssh/authorized_keys"
su $user_name -c "echo $public_key >> /home/$user_name/.ssh/authorized_keys"
chown $user_name /home/$user_name/.ssh
chown $user_name /home/$user_name/.ssh/authorized_keys

# permissions for yum.conf file
# chown $user_name /etc/yum.conf
# chmod 644 /etc/yum.conf