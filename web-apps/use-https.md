---
title: Use HTTPS
---

# Using HTTPS Is Required

*All Georgia EPD websites and web applications **MUST** be served over HTTPS only (including dev and test sites).*

Summary: An SSL certificate for `*.gaepd.org` is installed on all web servers. The URL Rewrite IIS module is also installed, making it easy to set up redirection for HTTP requests.

* [Why use HTTPS?](#why-use-https)
* [How to enable HTTPS for your website](#how-to-enable-https-for-your-website)
* [Bonus: How to enable HSTS](#bonus-how-to-enable-hsts)
* [Final `web.config` File](#final-web.config-file)
* [Testing](#testing)

## Why use HTTPS?

HTTPS helps protect the privacy and security of your users, even if personal information is not being transmitted. Also, HTTPS is required for many newer technologies (e.g., service workers, geo-location).

> Every unencrypted HTTP request reveals information about a user’s behavior, and the interception and tracking of unencrypted browsing has become commonplace. Today, **there is no such thing as non-sensitive web traffic,** and public services should not depend on the benevolence of network operators.
>
> — <cite>[The HTTPS-Only Standard](https://https.cio.gov/everything/)</cite>

This is especially true for government websites.

> Citizens expect government websites to be secure, trustworthy, and reliable. Citizens expect anything they read on a `.gov` website to be official, and they expect any information they submit to that website — especially if they’re submitting personal information — to be sent safely and only to the government.
>
> — <cite>[Eric Mill, 18F](https://18f.gsa.gov/2014/11/13/why-we-use-https-in-every-gov-website-we-make/)</cite>

This policy applies to Dev and Test sites as well since those sites often still require the use of passwords and often display data copied from the production site. Plus, if you aren't testing under the same conditions that exist in Production, you aren't testing everything.

## How to enable HTTPS for your website

In IIS Manager, select your site and then select "Bindings..." under the Edit Site Actions. Add a new binding, choose "https" for the type, select the "*.gaepd.org" SSL certificate, and enter the host name.

![Screenshot of IIS "Add Site Binding" tool](img/https-add-binding.png)

Each website should have two bindings, one each for HTTP and HTTPS. (The HTTP binding is required so that you can enable redirection.)

![Screenshot of IIS "Site Bindings" tool](img/https-bindings.png)

*Important note:* The SSL certificate has a wildcard sub-domain, but be aware that this only works for a single sub-domain segment. A sub-sub-domain (like `https://dev.geco.gaepd.org`) will *not* work correctly. Therefore, when creating URLs for test sites, use a hyphenated subdomain (e.g., `https://dev-geco.gaepd.org`).

*Another important note:* The SSL certificate installed does not work for domains other than `gaepd.org`. If you need to use a different domain name, include the purchase and maintenance of a separate SSL certificate in your development costs.

### Ensure your site works correctly

In particular, watch out for hard-coded internal links and mixed security content. Mixed security content occurs when embedded scripts, images, etc. are served from HTTP while the main page is served over HTTPS. See [What Is Mixed Content?](https://developers.google.com/web/fundamentals/security/prevent-mixed-content/what-is-mixed-content) for a more detailed description.

To fix this, search for all instances of `http:` in your source code, verify that an HTTPS version is available for the resource, and then change the
link.

Also, when linking to external sites, it is best practice to link to an HTTPS version if one exists.

### Redirect HTTP requests

* HTTP requests to websites should be seamlessly redirected to an identical request over HTTPS.
* Web APIs should either not listen on HTTP or close the connection with status code 400 (Bad Request).

Once you have verified that the site is fully functional in HTTPS, the last step is to permanently redirect all HTTP traffic to the HTTPS site. The [URL Redirect Module](https://docs.microsoft.com/en-us/iis/extensions/url-rewrite-module/using-the-url-rewrite-module) has been installed on all web servers for this purpose. To enable it, copy this snippet into your web.config file within the `<system.webServer>`:

```xml
<rewrite>
    <!-- This section requires the URL Rewrite module to be installed in IIS. -->
    <rules>
        <rule name="HTTP to HTTPS redirect" stopProcessing="true">
            <match url="(.*)" />
            <conditions>
                <add input="{SERVER_PORT_SECURE}" pattern="^0$" />
            </conditions>
            <action type="Redirect" redirectType="Permanent"
                url="https://{HTTP_HOST}/{R:1}" />
        </rule>
    </rules>
</rewrite>
```

This snippet uses a permanent redirect type (301 Moved Permanently).

### Don't forget the cookies

Browser cookies set by your application should be similarly secured. While you have web.config open, add this line within the `<system.web>` element:

```xml
<httpCookies requireSSL="true" httpOnlyCookies="true"/>
```

## Bonus: How to enable HSTS

If you are committed to HTTPS and have thoroughly tested your site, you should consider enabling HTTP Strict Transport Security (HSTS).

> [HSTS] allows a website to declare itself as a secure host and to inform browsers that it should be contacted only through HTTPS connections. HSTS is an opt-in security enhancement that enforces HTTPS and significantly reduces the ability of man-in-the-middle type attacks to intercept requests and responses between servers and clients.
>
> — <cite>[IIS 10.0 Version 1709 HTTP Strict Transport Security (HSTS) Support](https://docs.microsoft.com/en-us/iis/get-started/whats-new-in-iis-10-version-1709/iis-10-version-1709-hsts#http-strict-transport-security-hsts)</cite>

How to enable HSTS depends on which version of IIS you are using. The following instructions are valid for our current version. (But see the above link for later versions.)

Within the `<rewrite>` element added above, include the following lines and test thoroughly:

```xml
<outboundRules>
    <rule name="Add STS header when HTTPS" enabled="true">
        <match serverVariable="RESPONSE_Strict_Transport_Security"
            pattern=".*" />
        <conditions>
            <add input="{HTTPS}" pattern="on" ignoreCase="true" />
        </conditions>
        <action type="Rewrite" value="max-age=300" />
    </rule>
</outboundRules>
```

The **max-age** value is set in this example at 5 minutes (300 seconds). *This is for testing purposes only.*

[It is recommended](https://hstspreload.org/#deployment-recommendations) to ramp up the **max-age** value stepwise from 5 minutes to 1 week, 1 month, and finally 2 years, fully testing each step for the enabled time period. I've created a page to track [HSTS implementation status](https://bitbucket.org/snippets/gaepdit/4nX8Ee) for my applications; you may want to use something similar.

## Final `web.config` file

**Do NOT just copy and paste the following without first reading the above and testing your site thoroughly. This is provided for reference only.**

Once complete, the `web.config` file should look similar to the following (unrelated settings have been removed):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <system.webServer>
        <rewrite>
            <!-- This section requires the URL Rewrite module to be installed in IIS. -->
            <rules>
                <rule name="HTTP to HTTPS redirect" stopProcessing="true">
                    <match url="(.*)" />
                    <conditions>
                        <add input="{SERVER_PORT_SECURE}" pattern="^0$" />
                    </conditions>
                    <action type="Redirect" redirectType="Permanent"
                        url="https://{HTTP_HOST}/{R:1}" />
                </rule>
            </rules>
            <outboundRules>
                <rule name="Add STS header when HTTPS" enabled="true">
                    <match serverVariable="RESPONSE_Strict_Transport_Security"
                        pattern=".*" />
                    <conditions>
                        <add input="{HTTPS}" pattern="on" ignoreCase="true" />
                    </conditions>
                    <action type="Rewrite" value="max-age=604800" />
                </rule>
            </outboundRules>
        </rewrite>
    </system.webServer>
    <system.web>
        <httpCookies requireSSL="true" httpOnlyCookies="true"/>
    </system.web>
</configuration>
```

## Testing

You can easily test that the above changes have taken effect using curl. Run `curl -I <url>` for both the HTTP and HTTPS versions of your URL and look for the correct headers highlighted below.

* `curl -I http://<subdomain>.gaepd.org` should return the header `HTTP/1.1 301 Moved Permanently`.
* `curl -I https://<subdomain>.gaepd.org` should return `HTTP/2 200 OK` and (if you have enabled HSTS) `Strict-Transport-Security: max-age=604800` (max-age value should match the value in `web.config`).

![Screenshot of curl examples](img/https-curl-examples.png)
