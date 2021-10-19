# Creating and installing a new SSL certificate

Follow these steps to create a new SSL certificate and install it on one of the web servers.

1. [Generate a Certificate Signing Request](https://support.godaddy.com/help/iis-10windows-server-2016-generate-csrs-certificate-signing-requests-27348) (CSR) on the web server.

2. Purchase and [request an SSL certificate](https://support.godaddy.com/help/request-my-ssl-certificate-with-a-certificate-signing-request-csr-40441) from GoDaddy.

3. Download and [manually install the SSL certificate](https://support.godaddy.com/help/manually-install-an-ssl-certificate-on-my-iis-10-server-27349) on the web server that was used in step 1.

Then, follow the instructions below to export the certificate and install it on the remaining web servers.

## Export SSL Certificate using IIS

1.	Go to **Start >> Administrative Tools >> Internet Information Services (IIS) Manager**.
2.	Select the server on which the certificate is installed.
3.	Choose the **Server Certificates** option on the central menu:

    ![Screenshot: IIS server page with the "Server Certificates" option selected](img/ssl-1.png)

4.	Right-click on the needed certificate and select **Export**.

    ![Screenshot: IIS Server Certificates page with the certificate selected and the option menu (right-click menu) open, highlighting the "Export" option](img/ssl-2.png)

5.	Specify the filename, location, and PFX export password and click **OK**:

    ![Screenshot: IIS Export Certificate dialog](img/ssl-3.png)

A PFX file has now been exported and can be found in the specified location. Importing a certificate on a new server can be also performed by using either Microsoft Management Console or IIS Manager.

## Import PFX using IIS Manager

1.	Launch Internet Information Services Manager (**Start >> Administrative Tools >> Internet Information Services (IIS) Manager**) and choose the server the certificate should be imported to.
2.	Double-click **Server Certificates** in the central menu.

    ![Screenshot: IIS server page with the "Server Certificates" option selected](img/ssl-1.png)

3.	Click the **Import** button in the right-hand menu:

    ![Screenshot: IIS Server Certificates page with the certificate selected, highlighting the "Import" option](img/ssl-5.png)

4.	Locate the PFX file on your machine and specify the password that was used when exporting the certificate. Optionally, you may check **Allow this certificate to be exported**. Then, click **OK**:

    ![Screenshot: IIS Import Certificate dialog](img/ssl-6.png)

### Assigning a certificate to a website

Once the certificate has been imported by any of the methods described above, it will be shown in the list of server certificates in IIS Manager.

After that, please make sure to complete the **binding** of the certificate to a specific website.
 
![Screenshot: IIS Web Site page highlighting the "Bindings" option](img/ssl-7.png)

![Screenshot: IIS Site Bindings dialog with the "https" entry selected, highlighting the "Edit" option](img/ssl-8.png)

![Screenshot: IIS Edit Site Binding dialog for the "https" entry highlighting the "SSL certificate" dropdown and the "OK" button](img/ssl-9.png)

***Note:*** *Usually, there is no need to restart the server, so after the SSL certificate has been installed and the binding created, your site should show new certificate, if not then restart the server and test again.*
