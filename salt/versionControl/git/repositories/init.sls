include:
  - versionControl.git
  - network.ssh.config.client

{% for repo, config in pillar['git'].iteritems() %}
Create Directory ({{ config['target'] }}):
  file.directory:
    - name: {{ config['target'] }}
    - user: {{ config['user'] }}
    - group: {{ config['user'] }}
    - makedirs: true
    - recurse:
      - user
      - group

Git Latest ({{ repo }}):
  git.latest:
    - name: {{ repo }}
    - rev: {{ config['rev'] }}
    - target: {{ config['target'] }}
    - user: {{ config['user'] }}
  require:
    - pgk: Git Latest
    - sls: network.ssh.config
{% endfor %}