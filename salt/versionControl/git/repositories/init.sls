include:
  - versionControl.git
  - network.ssh.config

{% for repo, config in pillar['git'].iteritems() %}
Create Directory ({{ config['target'] }}):
  file.directory:
    - name: {{ config['target'] }}
    - user: {{ config['username'] }}
    - group: {{ config['username'] }}
    - makedirs: true
    - recurse:
      - user
      - group

Git Latest ({{ repo }}):
  git.latest:
    - name: {{ repo }}
    - rev: {{ config['rev'] }}
    - target: {{ config['target'] }}
    - user: {{ config['username'] }}
  require:
    - pgk: Git Latest
    - sls: network.ssh.config
{% endfor %}