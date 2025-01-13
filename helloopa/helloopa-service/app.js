const express = require('express'); // Express.js 
const axios = require('axios') // Axios is middleware that handles async requests

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

const port = 3000;
app.listen(port, () => {
    console.log("HelloOPA Service is running on port: " + port);
});

// HelloOPA Service router for /health endpoint.
app.get('/health', function (req, res, next) {
    res.status(200).send('Welcome to Hello OPA Service. Please make GET policy requests using /request endpoint.');
});

// HelloOPA Service router for /request endpoint.
app.get('/request', async (req, res, next) => {
    let requestGroup = req.header('group')
    let requestResource = req.header('resource')
    let requestData = { "input": { "group": requestGroup, "resource": requestResource } }

    // Make HTTP Request to Policy Service (OPA) with Request Data 
    let policyServiceURL = 'http://localhost:8181/v1/data/opablog/allow'
    const policyServiceRequest = async () => {
        try {
            const policyResponse = await axios.post(policyServiceURL, requestData);
            return (policyResponse.data.result)
        } catch (err) {
            console.error(err);
        }
    }

    // After evaluation, return Policy Decision to the user.
    let policyServiceResult = await policyServiceRequest()
    if (policyServiceResult) {
        res.status(200).send("Policy Decision: " + policyServiceResult + ". User IS authorized to access " + requestResource);
        return
    }
    else if (!policyServiceResult) {
        res.status(401).send("Policy Decision: " + policyServiceResult + ". User NOT authorized to access " + requestResource);
        return
    }
    else {
        res.status(500).send("Policy Decision: " + policyServiceResult + ". Policy Service (OPA) unreachable or malformed response.");
        return
    }
});
module.exports = app;