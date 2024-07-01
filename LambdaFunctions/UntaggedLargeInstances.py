import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')
    
    response = ec2.describe_instances(
        Filters=[
            {'Name': 'instance-state-name', 'Values': ['running']}
        ]
    )
    
    instance_types_to_ignore = ['t2.medium', 't2.small', 't2.micro', 't2.nano']
    
    instances_to_terminate = []
    
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_type = instance['InstanceType']
            tags = {tag['Key']: tag['Value'] for tag in instance.get('Tags', [])}
            if instance_type not in instance_types_to_ignore and tags.get('donotterminate') != 'True':
                instances_to_terminate.append(instance['InstanceId'])
    
    if instances_to_terminate:
        ec2.terminate_instances(InstanceIds=instances_to_terminate)
        print(f'Terminated instances: {instances_to_terminate}')
    else:
        print('No instances to terminate')
