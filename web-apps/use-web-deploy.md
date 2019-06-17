---
title: Web Deploy
---

# Web Deploy Setup and Use

Web Deploy is a tool that enables one-click deployment of web applications directly from Visual Studio, with no need to open RDP or FTP. Web Deploy has been installed and configured on the five CMS web servers. Here are the basics for using it:

0.  Install and configure Web Deploy on the server. (Yippee! This part's done.)

1.  In IIS Manager on the web server, add individual SOG users to the web site using the IIS Manager Permissions tool:

    * Select the website you want to publish to.
    * Open the "IIS Manager Permissions" tool.
    * Select the "Allow User..." Action.
    * Enter the SOG account you want to add as a Windows user, e.g., "SOG\DWaldron".
    * Select OK.

    Repeat this for each user on each web server as necessary.

1.  In Visual Studio, add a Publishing Profile for each web server destination you want to publish to.

    * First, enable the Visual Studio Web Deploy toolbar. Select View → Toolbars → Web One Click Publish.
    * In the toolbar dropdown, select "New Custom Profile..."
    * The Publish tool that gets displayed will differ depending on the type of project you are working on, but pay attention to these key fields:
      * Server: `your-url.gaepd.org/msdeploy.axd?site=iis-site-name`
      * Site name: This is the name of the website as listed in IIS. Generally, we have been using the URL for the name.
      * **Leave User name and Password blank!** (You will be prompted for these every time you publish.)
    * Select "Validate Connection" to test the settings.
    * When you save the publishing profile, an XML file named `YourProfileName.pubxml` with your settings will be saved in your project. Some settings can be changed using the UI in Visual Studio, but other settings have to be changed by directly editing the XML file.
    * To enable automatic backups, edit the XML file and ensure the `<EnableMSDeployBackup>` element is set to "True".
    * Commit the new Publish Profile into your Git repository. Make sure your project `.gitignore` file is set to ignore `*.user` and NOT `*.pubxml`. The latest [recommended `.gitignore` file](https://gitlab.com/ga-epd-it/misc/blob/master/Git/sample.gitignore) is configured correctly.

    Repeat this for each web server/destination as necessary.

1.  Optionally, [add `Web.config` transformations](https://docs.microsoft.com/en-us/aspnet/web-forms/overview/deployment/visual-studio-web-deployment/deploying-to-iis#configure-publish-profile-transforms) for settings that differ between publication destinations. Transformation files uses the [XDT transformation syntax](<(https://msdn.microsoft.com/en-us/library/dd465326.aspx)>) to overwrite portions of the `Web.config` file when publishing.

Repeat Steps 1 through 3 for each web server destination you want to publish to (e.g., Dev, UAT, & Prod).
