# Fetching jobs from WCN

## RSS

WCN publish an RSS feed of all jobs, at;

```
https://justicejobs.tal.net/vx/mobile-0/appcentre-1/brand-2/candidate/jobboard/vacancy/3/feed
```

In theory, you can add `?ftq=prison+officer` to filter this, but if you do that then
you only get the first 50.

So, this code leaves off the `ftq` parameter, and filters the list after retrieval.

The RSS feed is very basic, and the code here which parses it is very fragile, depending on
the exact format and string labels that WCN use. e.g;

```
<entry xml:base="https://justicejobs.tal.net/vx/mobile-0/appcentre-1/brand-13/candidate/so/pm/1/pl/3/opp/9908-201706-Prison-Officer-HMP-YOI-Downview/en-GB">
  <id>https://justicejobs.tal.net/vx/mobile-0/appcentre-1/brand-13/candidate/so/pm/1/pl/3/opp/9908-201706-Prison-Officer-HMP-YOI-Downview/en-GB</id>
  <link rel="alternate" href="https://justicejobs.tal.net/vx/mobile-0/appcentre-1/brand-13/candidate/so/pm/1/pl/3/opp/9908-201706-Prison-Officer-HMP-YOI-Downview/en-GB" type="text/html"/>
  <title>201706: Prison Officer - HMP/YOI Downview</title>
  <updated>2017-05-31T23:00:00Z</updated>
  <published>2017-05-31T23:00:00Z</published>
  <content type="xhtml">
    <div xmlns="http://www.w3.org/1999/xhtml">Vacancy Title:201706: Prison Officer - HMP/YOI Downview<br/>
    Vacancy Id:9908<br/>
    Role Type:Operational Delivery,Prison Officer<br/>
    Salary:£31,453<br/>
    Location:Sutton <br/>
    Closing Date:7 Jul 2017 23:55 BST<br/>
    </div>
  </content>
</entry>
```

## HTML

The corresponding HTML page is here;

```
https://justicejobs.tal.net/vx/lang-en-GB/mobile-0/appcentre-1/brand-2/xf-a5f8e63220f3/candidate/jobboard/vacancy/3/adv/?ftq=prison+officer
```

# TODO

* Turn `salary` into a number (or a range)

Examples of real `salary` values;

```
For 41 hours a week, £32,843, For 39 hours a week, £31,453
£26,456
£28,456 - £29,403
£29, 453
```

* Turn `closing_date` into a date
