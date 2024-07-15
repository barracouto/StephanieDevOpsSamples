// This Lambda function is designed to redirect S3 static webpages to their 
// respective AWS regions. Name this file index.js when creating the Lambda function. 
// It redirects requests to the appropriate regional S3 bucket and includes logging
// for debugging and monitoring purposes, which can be viewed in CloudWatch Logs. 
// To disable logging, remove or comment out the console.log statements.


'use strict';

exports.handler = async (event, context) => {
    console.log('Event:', JSON.stringify(event, null, 2));  // Log the entire event object
    const request = event.Records[0].cf.request;

    const countryToRegion = {
        'DE': 'eu-central-1', // Frankfurt
        'IE': 'eu-west-1', // Ireland
        'SE': 'eu-north-1' // Stockholm
    };

    if (request.headers['cloudfront-viewer-country']) {
        const countryCode = request.headers['cloudfront-viewer-country'][0].value;
        console.log('Country Code:', countryCode);  // Log the country code
        const region = countryToRegion[countryCode];
        console.log('Region:', region);  // Log the determined region

        if (region) {
            request.origin.s3.region = region;
            const domainName = `mt-cloudfront-${region}.s3.amazonaws.com`;
            console.log('Domain Name:', domainName);  // Log the domain name
            request.origin.s3.domainName = domainName;
            request.headers['host'] = [{ key: 'host', value: domainName }];
        }
    }

    console.log('Final Request:', JSON.stringify(request, null, 2));  // Log the modified request object
    return request;
};
