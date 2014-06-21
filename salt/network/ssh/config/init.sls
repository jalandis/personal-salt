# SSH Private/Public Keys
{% for user, config in pillar['keys'].iteritems() %}
Creating Private RSA Key ({{ user }}):
  file.managed:
    - name: /home/{{ user }}/.ssh/id_rsa
    - source: {{ config['private_rsa'] }}
    - user: {{ user }}
    - group: {{ user }}
    - mode: '0600'
    - makedirs: true
    - recurse:
      - user
      - group

Creating Public RSA Key ({{ user }}):
  file.managed:
    - name: /home/{{ user }}/.ssh/id_rsa.pub
    - source: {{ config['public_rsa'] }}
    - user: {{ user }}
    - group: {{ user }}
    - mode: '0700'
    - makedirs: true
    - recurse:
      - user
      - group
{% endfor %}

# SSH Known Hosts
{% for host, config in pillar['known_hosts'].iteritems() %}
Adding Known Host ({{ host }}):
  ssh_known_hosts:
    - present
    - name: {{ host }}
    - user: {{ config['username'] }}
    - fingerprint: {{ config['fingerprint'] }}
{% endfor %}