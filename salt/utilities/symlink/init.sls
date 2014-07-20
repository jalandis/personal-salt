include:
  - users

{% for target, config in pillar['symlink'].iteritems() %}
Creating Symlink ({{ target }}):
  file.symlink:
    - name: {{ config['source'] }}
    - target: {{ target }}
    - user: {{ config['owner'] }}
    - makedirs: true
{% endfor %}