### Puppeteer x Cheerio
```js
import puppeteer from "puppeteer";
import * as cheerio from 'cheerio';
const getQuotes = async () => {
  // Start a Puppeteer session with:
  // - a visible browser (`headless: false` - easier to debug because you'll see the browser in action)
  // - no default viewport (`defaultViewport: null` - website page will in full width and height)
  const browser = await puppeteer.launch({
    headless: false,
    defaultViewport: null,
    slowMo : 250
  });

  // Open a new page
  const page = await browser.newPage();

  // On this new page:
  // - open the "http://quotes.toscrape.com/" website
  // - wait until the dom content is loaded (HTML is ready)
  await page.goto("http://quotes.toscrape.com/", {
    waitUntil: "domcontentloaded",
  });

  // Get page data
  const quotes = await page.evaluate(() => {
    // Fetch the first element with class "quote"
    // Get the displayed text and returns it
    const quoteList = document.querySelectorAll(".quote");
    //console.log(document.querySelector("body > div > div:nth-child(2) > div.col-md-8 > nav > ul > li > a").innerText);

    // Convert the quoteList to an iterable array
    // For each quote fetch the text and author
    return Array.from(quoteList).map((quote) => {
      // Get the sub-elements from the previously fetched quote element
      const text = quote.querySelector(".text").innerText;
      const author = quote.querySelector(".author").innerText;

      return { text, author };
    });
  });


  await page.content().then(
    (content) => {
      const x = cheerio.load(content);
      console.log("hello"+x('title').text());
    }
  );
  

};

// Start the scraping
getQuotes();
```
