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
    dislike = int(response['Item']['dislike'])
    like = response['Item']['like2']
    albumart = response['Item']['albumArt']
    albumartTest = response['Item']['album2']
    dislike += 1
    dislike = str(dislike)

    table.update_item(
        Key={
            'id': keyString
        },
        UpdateExpression='SET dislike = :val1',
        ExpressionAttributeValues={
            ':val1': dislike
        }
        )

    input = {'id': id, 'songName': song, 'dislike': dislike, 'artist': artist, 'albumart': albumart, 'albumTest': albumartTest}
    print(input)
    return {
        'statusCode': 200,
        'body': input
        }
