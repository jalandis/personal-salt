include:
  - versionControl.mercurial
  - network.ssh.config

{% for repo, config in pillar['hg'].iteritems() %}
Create Directory ({{ config['target'] }}):
  file.directory:
    - name: {{ config['target'] }}
    - user: {{ config['username'] }}
    - group: {{ config['username'] }}
    - makedirs: true
    - recurse:
      - user
      - group

Hg Latest ({{ repo }}):
  hg.latest:
    - name: {{ repo }}
    - rev: {{ config['rev'] }}
    - target: {{ config['target'] }}
    - user: {{ config['username'] }}
  require:
    - pgk: Mercurial Latest
    - sls: network.ssh.config
{% endfor %}