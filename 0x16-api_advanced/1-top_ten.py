#!/usr/bin/python3
"""
querries Reddit API and print  the titles of the first 10 posts
"""
import requests


def top_ten(subreddit):

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {
            'User-Agent': 'Mozilla/5.0'
    }
    params = {
            'limit': 10
    }
    response = requests.get(url,
                            headers=headers,
                            params=params,
                            allow_redirects=False)
    if response.status_code != 200:
        print(None)
        return
    res = response.json()
    hot_posts = res['data']['children']
    if len(hot_posts) == 0:
        print(None)
    else:
        for post in hot_posts:
            print(post['data']['title'])
