#!/usr/bin/python

import argparse
import sys
import os
import re

def getRemminaConfigFiles(remmina_dir):
  files = []
  for (dirpath, dirnames, filenames) in os.walk(remmina_dir):
    for filename in filenames:
      if '.remmina' in filename:
        files.append(os.path.join(remmina_dir, filename))
  return files

def findRemminaValue(filename, pattern, modifiers=re.M|re.I|re.X):
  print(pattern)
  compiledPattern = re.compile(pattern, modifiers)
  content = file(filename)
  for line in content:
    result = compiledPattern.match(line)

    if result:
      return result.group(1)

def remminaValueExists(filename, pattern, modifiers=re.M|re.I|re.X):
  compiledPattern = re.compile(pattern, modifiers)
  content = file(filename)
  found = [line for line in content if compiledPattern.match(line)]

  return len(found) > 0

def updateRemminaValue(filename, pattern, replacement, modifiers=re.M|re.I|re.X):
  compiledPattern = re.compile(pattern, modifiers)
  content = file(filename)
  updatedContent = []
  for line in content:
    updatedContent.append(compiledPattern.sub(replacement, line))

  configFile = open(filename, 'w')
  configFile.write(''.join(updatedContent))
  configFile.close()


def usernameExists(filename, username):
  return remminaValueExists(filename, 'username={}'.format(username))

def domainExists(filename, domain):
  return remminaValueExists(filename, 'domain={}'.format(domain))

def updatePassword(filename, password):
  return updateRemminaValue(filename, 'password=.*', 'password={}'.format(password))

if __name__ == '__main__':
  parser = argparse.ArgumentParser()
  parser.add_argument(
    '--remmina_dir',
    help='Remmina directory containing config file',
    required=True
  )
  parser.add_argument(
    '--username',
    help='Username in remmina files',
    required=True,
  )
  parser.add_argument(
    '--domain',
    help='Domain in remmina files',
    required=True,
  )
  parser.add_argument(
    '--password',
    help='Password to update files matching domain/username',
    required=True,
  )

  args = parser.parse_args()
  configFiles = getRemminaConfigFiles(args.remmina_dir)

  for configFile in configFiles:
    if (usernameExists(configFile, args.username) and domainExists(configFile, args.domain)):
      updatePassword(configFile, args.password)