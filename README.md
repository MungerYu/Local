



语言和地区的一些知识：

首先一个语言的描述规则是下面这样的：

```text
language-extlang-script-region-variant-extension-privateuse
语言文字种类-扩展语言文字种类-变体（或方言）-使用区域-变体（或方言）-扩展-私有
```

- language 全小写，通常两位，新版规范三位，比如：zh
- extlang 全小写，三位，表示扩展语言，比如：粤语 yue （这里还有个 macrolanguage 的事情，先不提了）
- script 首字母大写，四位，表示变体，比如：中文的 繁体字 Hant 和 简体字 Hans
- region 全大写，两位，表示用于地区，比如：都是繁体中文，香港的惯用语与台湾的会有区别

所以区别就很明显了：

- zh-CN 表示用在**中国大陆区域的中文**。包括各种大方言、小方言、繁体、简体等等都可以被匹配到。
- zh-Hans 表示**简体中文**。适用区域范围是全宇宙用中文简体的地方，内容包括各种用简体的方言等。

csv to json 

https://csvjson.com/csv2json



---



### ISO-3166 Country and Dependent Territories Lists with UN Regional Codes

These lists are the result of merging data from two sources, the Wikipedia [ISO 3166-1 article](http://en.wikipedia.org/wiki/ISO_3166-1#Officially_assigned_code_elements) for alpha and numeric country codes, and the [UN Statistics](https://unstats.un.org/unsd/methodology/m49/overview) site for countries' regional, and sub-regional codes. In addition to countries, it includes dependent territories.

The [International Organization for Standardization (ISO)](https://www.iso.org/iso-3166-country-codes.html) site provides partial data (capitalised and sometimes stripped of non-latin ornamentation), but sells the complete data set as a Microsoft Access 2003 database. Other sites give you the numeric and character codes, but there appeared to be no sites that included the associated UN-maintained regional codes in their data sets. I scraped data from the above two websites that is all publicly available already to produce some ready-to-use complete data sets that will hopefully save someone some time who had similar needs.

### What's available?

The data is available in

* JSON
* XML
* CSV

3 versions exist for each format

* `all.format` - Everything I can find, including regional and sub-regional codes
* `slim-2.format` - English name, numeric country code and alpha-2 code (e.g., NZ)
* `slim-3.format` - English name, numeric country code and alpha-3 code (e.g., NZL)

### What does it look like?

Take a peek inside the `all`, `slim-2` and `slim-3` directories for the full lists of JSON, XML and CSV.

Using JSON as an example:

#### all.json

    [
      {
        "name":"Nigeria",
        "alpha-2":"NG",
        "alpha-3":"NGA",
        "country-code":"566",
        "iso_3166-2":"ISO 3166-2:NG",
        "region":"Africa",
        "sub-region":"Sub-Saharan Africa",
        "intermediate-region":"Western Africa",
        "region-code":"002",
        "sub-region-code":"202",
        "intermediate-region-code":"011"
      },
      // ...
    ]

#### slim-2.json

    [
      {
        "name":"New Zealand",
        "alpha-2":"NZ",
        "country-code":"554"
      },
      // ...
    ]

#### slim-3.json

    [
      {
        "name":"New Zealand",
        "alpha-3":"NZL",
        "country-code":"554"
      },
      // ...
    ]

### Caveats

1. Please check the data independently for accuracy before using it in any system and for any purpose
1. Although I've tried to ensure the data is as accurate as possible, the data is not authoritative, and so should not be considered accurate

### scrubber.rb

`scrubber.rb` is a dirty Ruby script I used to generate these files. You can run it yourself if you wish to re-generate the files fresh from the sources.

To install the gems in the Gemfile:

    bundle

To run:

    bundle exec ruby scrubber.rb

Note, due to file encoding issues the script should only be run using Ruby 1.9 or above.

### Timestamp

* UN Statistical data retrieved 8 December 2020
* Wikipedia data retrieved 8 December 2020, from a document last revised 19 November 2020

### Revisions

* 8 December 2020 - `tag 9.0`
* 19 March 2019 - `tag 8.0`
* 25 July 2018 - `tag 7.0`
* 10 April 2018 - `tag 6.0`
* 26 August 2016 - `tag 5.0`
* 28 August 2015 - `tag 4.0`
* 20 April 2014 - `tag 3.0`
* 13 June 2012 - `tag 2.0`
* 18 May 2011 - `tag 1.0`
