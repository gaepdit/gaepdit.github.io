# Tracking Deployments in Raygun

Raygun is an application error reporting and performance monitoring service. Though not mandatory, adding [deployment information to Raygun](https://raygun.com/platform/deployment-tracking) enables additional features for monitoring software health. Raygun deployment tracking correlates application releases with the version information sent with error reports. A GitHub action is available to automate this.

## Setup

1. To add the GitHub action to your repository, go to the "Actions" tab on the repo webpage.

    ![Screenshot: A GitHub repo page with the "Actions" tab selected](img/github-actions-1.png)

2. Look for and select the "Raygun Deployment Tracking Workflow" action. (If other actions have already been added to the repo, click the "New workflow" button.)

    ![Screenshot: The "Workflows created by Georgia EPD IT" section of the GitHub actions page](img/github-actions-2.png)

3. Review the workflow file and update the tag version prefix if needed.

    ![Screenshot: The Raygun deployment YAML file open in the GitHub file editor, highlighting the "tags" entry](img/github-actions-3.png)

4. Click "Start commit" and update the commit message and description as desired.

    ![Screenshot: The GitHub file editor "Commit new file" dialog](img/github-actions-4.png)

5. Go to the "Settings" tab on the repo, select "Secrets" in the menu, and add two new repository secrets:

    * `RAYGUN_AUTHTOKEN` is an "External Access Token" generated in your [Raygun user account](https://app.raygun.com/user).
    * `RAYGUN_APIKEY` is the API Key for the application in Raygun.

    ![Screenshot: The "New secret" section of the GitHub repo "Actions secrets" page](img/github-actions-5.png)

## Tracking App Deployment

There are two steps for tracking a new deployment in Raygun:

1. *Set a version number in your application.* The version number is automatically sent to Raygun with each error report. In .NET projects, the version number can be set by specifying the [`AssemblyVersion` attribute](https://docs.microsoft.com/en-us/troubleshoot/visualstudio/general/assembly-version-assembly-file-version) in the project file.

2. *Add a version tag to the repository.* The GitHub action above will be triggered when a new version tag is pushed to the repository. Version tags should begin with a prefix, for example, `prod/1.0.0` or `v/1.0.0`. The prefix is specified in the GitHub action, and the version number in the tag should match the application version.

![Screenshot: An abbreviated git log command showing the most recent commit to bump the version number with a tag matching the version number](img/github-actions-7.png)

## Results

After pushing a new release/tag, you can verify that the action successfully ran by visiting the Actions tab in the repo and the Deployments tab in the Raygun application.

![Screenshot: The GitHub "Actions" tab showing the successful Raygun Deployment Tracking workflow](img/github-actions-8.png) 

![Screenshot: the Raygun "Deployments" page showing the versioned deployment entry](img/github-actions-9.png)
