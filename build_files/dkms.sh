mkdir /usr/src/macbook12-bluetooth-1.0
git clone https://github.com/leifliddy/macbook12-bluetooth-driver.git /usr/src/macbook12-bluetooth-1.0
dkms add -m macbook12-bluetooth -v 1.0
dkms build -m macbook12-bluetooth -v 1.0
dkms install -m macbook12-bluetooth -v 1.0
