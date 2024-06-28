import json
import boto3

sns_client = boto3.client('sns')

def lambda_handler(event, context):

    findings = event['detail']['findings']
    message = "Security Hub Findings:\n\n"
    for finding in findings:
        message += f"Title: {finding['Title']}\n"
        message += f"Description: {finding['Description']}\n"
        message += f"Severity: {finding['Severity']['Label']}\n"
        message += f"Resources: {', '.join([resource['Id'] for resource in finding['Resources']])}\n\n"

    sns_client.publish(
        TopicArn='arn:aws:sns:us-east-1:637423298209:MT-SecurityHubAlerts',
        Message=message,
        Subject='Security Hub Alert'
    )
