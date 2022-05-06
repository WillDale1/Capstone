import json
import boto3
import requests

# THIS WORKS, DON'T CHANGE
def lambda_handler(event, context):
    # TODO implement
    dynamodb = boto3.resource('dynamodb', region_name='us-west-2')
    table = dynamodb.Table('userDB2')
    
    keyNew = table.get_item(Key={'id': '40'})
    keyString = int(keyNew['Item']['placeholder'])
    
    if keyString == 14: 
        keyString = 0
    
    keyString += 1
    keyString = str(keyString)
    
    response = table.get_item(Key={'id': keyString})
    
    table.update_item(
        Key={
            'id': '40'
            },
        UpdateExpression='SET placeholder = :val1',
        ExpressionAttributeValues={
            ':val1': keyString
        }
        )
        
    response = table.get_item(Key={'id': keyString})
    
    item = response['Item']
    id = response['Item']['id']
    song = response['Item']['songName']
    artist = response['Item']['artist']
    dislike = response['Item']['dislike']
    like = response['Item']['like2']
    albumart = response['Item']['albumArt']
    albumartTest = response['Item']['album2']
    
    input = {'id': id, 'songName': song, 'like': like, 'artist': artist, 'albumart': albumart, 'albumTest': albumartTest}
    
    return {
        'statusCode': 200,
        'body': input 
        }
