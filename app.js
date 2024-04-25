const express = require('express')
const request = require('request')
const cheerio = require('cheerio')
const cors = require('cors');

const app = express();
app.use(cors());
const port = process.env.PORT || 7000;

app.get('/', (req, res) => {
    res.send("API is running.....<br>24/7 API form Sanjog Singh, <br>You can get rate of any stock listed in BSE. <br>All you need to do just add some text after the currently running url \"/get_rate/stock-name\" <br>where \"stock-name\" is the exact symbol of the stock name listed in BSE.<br><br>For example: <br>\tSymbol of the \"Exide Industries Ltd\" is \"EXIDEIND\"");
});

app.get("/get_rate/:stock_name", async (req, res) => {
    const name = req.params.stock_name;
    console.log(name);
    const url = `https://www.google.com/finance/quote/${name}:NSE?sa=X&sqi=2&ved=2ahUKEwjuz-ix38aFAxUvRmwGHTMwC0UQ3ecFegQINRAf`;
    
    // make a function to request
    await request(url, price)
    
    async function price (err, response, html_rate) {
        if (!err && response.statusCode == 200) {
            // rate is the extracted price of stock with symbols and commas
            // where cost is the filtered price of stock after removing all symbols and commas
            const rate = await extract_rate(html_rate);
            const cost = [rate[0]/*.replace(/[^\d.]/g, '')*/, rate[1].replace(/[^\d.]/g, '')/*, rate[2].replace(/[^\d.]/g, '')*/];
            res.status(200).send(cost);
        }
        else {
            console.log(err);
            res.status(500).send('Error feching stock price, may be wrong company_symbol had been passed');
        }
    }

});

async function extract_rate (html_rate) {

    const $ = cheerio.load(html_rate);
    const texxt = $('zzDege'/*'.P2Luy.Ebnabc.ZYVHBb ...V7hZne  ...JwB6zf.V7hZne'*/).text();
    console.log(texxt);
    const element = [$('.zzDege'), $('.YMlKec.fxKbKc')/*, $('.JwB6zf.V7hZne')*/];
const rate = [element[0].text(), element[1].text()/*, element[2].html()*/];
    return rate;
}

app.listen(port, () => {
    console.log(`Server is listening at port number ---> ${port} <---`);
});
