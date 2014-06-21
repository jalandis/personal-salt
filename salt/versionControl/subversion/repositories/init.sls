include:
  - versionControl.subversion
  - network.ssh.config

{% for repo, config in pillar['svn'].iteritems() %}
Create Directory ({{ config['target'] }}):
  file.directory:
    - name: {{ config['target'] }}
    - user: {{ config['username'] }}
    - group: {{ config['username'] }}
    - makedirs: true
    - recurse:
      - user
      - group

Subversion Latest ({{ repo }}):
  hg.latest:
    - name: {{ repo }}
    - rev: {{ config['rev'] }}
    - target: {{ config['target'] }}
    - user: {{ config['username'] }}
  require:
    - pgk: Subversion Latest
    - sls: network.ssh.config
{% endfor %}