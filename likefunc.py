import json
import boto3
import requests

# THIS WORKS, DON'T CHANGE
def lambda_handler(event, context):
    # TODO implement
    
    dynamodb = boto3.resource('dynamodb', region_name='us-west-2')
    table = dynamodb.Table('userDB2')
    
    keyNew = table.get_item(Key={'id': '40'})
    keyString = keyNew['Item']['placeholder']
    response = table.get_item(Key={'id': keyString})
    
    item = response['Item']
    id = response['Item']['id']
    song = response['Item']['songName']
    artist = response['Item']['artist']
    dislike = response['Item']['dislike']
    like = int(response['Item']['like2'])
    albumart = response['Item']['albumArt']
    albumartTest = response['Item']['album2']
    like += 1
    like = str(like)

    table.update_item(
        Key={
            'id': keyString
        },
        UpdateExpression='SET like2 = :val1',
        ExpressionAttributeValues={
            ':val1': like
        }
        )

    input = {'id': id, 'songName': song, 'like': like, 'artist': artist, 'albumart': albumart, 'albumTest': albumartTest}
    print(input)
    return {
        'statusCode': 200,
        'body': input
        }
