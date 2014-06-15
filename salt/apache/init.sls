

Apache:
  pkg.latest:
    {% if grains['os'] == 'Ubuntu' %}
    - name: Apache
    {% endif%}