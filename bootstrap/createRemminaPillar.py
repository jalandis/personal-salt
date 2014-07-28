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
  compiledPattern = re.compile(pattern, modifiers)
  content = file(filename)
  for line in content:
    result = compiledPattern.match(line)

    if result:
      return result.group(1)

def parseTitle(filename):
  return findRemminaValue(filename, r'name=(.*)')

def parseUsername(filename):
  return findRemminaValue(filename, r'username=(.*)')

def parseGroup(filename):
  return findRemminaValue(filename, r'group=(.*)')

def parseShareFolder(filename):
  return findRemminaValue(filename, r'sharefolder=(.*)')

def parseDomain(filename):
  return findRemminaValue(filename, r'domain=(.*)')

def parsePassword(filename):
  return findRemminaValue(filename, r'password=(.*)')

def parseServer(filename):
  return findRemminaValue(filename, r'server=(.*)')

def parseColordepth(filename):
  return findRemminaValue(filename, r'colordepth=(.*)')

if __name__ == "__main__":
  parser = argparse.ArgumentParser()
  parser.add_argument(
    '--remmina_dir',
    help='Remmina directory containing config file',
    required=True
  )
  parser.add_argument(
    '--pillar_file',
    help='Pillar file to create (Default=remmina.sls)',
    required=False,
    type=argparse.FileType('w'),
    default=sys.stdout
  )
  parser.add_argument(
    '--username',
    help='Username for pillar remmina data',
    required=False,
    default='username'
  )

  args = parser.parse_args()
  configFiles = getRemminaConfigFiles(args.remmina_dir)

  args.pillar_file.write('remmina:\n')
  args.pillar_file.write('  {}:\n'.format(args.username))
  for configFile in configFiles:
    args.pillar_file.write('    {}:\n'.format(parseTitle(configFile)))
    args.pillar_file.write('      group: {}\n'.format(parseGroup(configFile)))
    args.pillar_file.write('      password: {}\n'.format(parsePassword(configFile)))
    args.pillar_file.write('      username: {}\n'.format(parseUsername(configFile)))
    args.pillar_file.write('      sharefolder: {}\n'.format(parseShareFolder(configFile)))
    args.pillar_file.write('      domain: {}\n'.format(parseDomain(configFile)))
    args.pillar_file.write('      server: {}\n'.format(parseServer(configFile)))
    args.pillar_file.write('      colordepth: {}\n'.format(parseColordepth(configFile)))