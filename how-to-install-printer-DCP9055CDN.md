# Download deb files

Download debs for Debian/Ubuntu 64bit from here: 
https://support.brother.com/g/b/downloadhowto.aspx?c=as_ot&lang=en&prod=dcp9055cdn_eu_as&os=128&dlid=dlf005573_000&flang=4&type3=561
https://support.brother.com/g/b/link.aspx?faqid=faq00100548 
https://support.brother.com/g/b/link.aspx?os=128&type3=559

The files are called:
  * `dcp9055cdnlpr-1.1.1-5.i386.deb`
  * `dcp9055cdncupswrapper-1.1.1-5.i386.deb`

# Install driver from deb

sudo dpkg -i --force-all dcp9055cdnlpr-1.1.1-5.i386.deb
sudo dpkg -i --force-all dcp9055cdncupswrapper-1.1.1-5.i386.deb

# Configure network printer from web interface

Open a web browser and go to: http://localhost:631/printers
Click `Administration` -> `Modify Printer` and set following parameters by choosing http and paste this the http: field:

    dnssd://Brother%20DCP-9055CDN._pdl-datastream._tcp.local/


Apply and check that the following data is shown on the printer page: http://localhost:631/printers/DCP9055CDN


    Description:	DCP9055CDN
    Location:	Brother
    Driver:	Brother DCP-9055CDN CUPS (color)
    Connection:	dnssd://    Brother%20DCP-9055CDN._pdl-datastream._tcp.local/
    Defaults:	job-sheets=none, none media=iso_a4_210x297mm sides=one-sided
 