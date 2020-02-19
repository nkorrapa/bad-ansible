#!/bin/sh

# Skeleton of content below generated with:
#
#   ansible-inventory --list >hosts.sh
#
# Then GUID string was substituted with var.

cat <<EOF
{
    "_meta": {
        "hostvars": {
            "app1": {
                "ansible_host": "app1.${GUID}.internal", 
                "timeout": 60
            }, 
            "app2": {
                "ansible_host": "app2.${GUID}.internal", 
                "timeout": 60
            }, 
            "appdb1": {
                "ansible_host": "appdb1.${GUID}.internal", 
                "timeout": 60
            }, 
            "frontend1": {
                "ansible_host": "frontend1.${GUID}.internal", 
                "timeout": 60
            }, 
            "support1": {
                "ansible_host": "support1.${GUID}.internal", 
                "timeout": 60
            }
        }
    }, 
    "all": {
        "children": [
            "threetierapp", 
            "ungrouped"
        ],
        "vars": {
            "GUID": "${GUID}"
        }
    }, 
    "appdbs": {
        "hosts": [
            "appdb1"
        ]
    }, 
    "apps": {
        "hosts": [
            "app1", 
            "app2"
        ]
    }, 
    "frontends": {
        "hosts": [
            "frontend1"
        ]
    }, 
    "support": {
        "hosts": [
            "support1"
        ]
    }, 
    "threetierapp": {
        "children": [
            "appdbs", 
            "apps", 
            "frontends", 
            "support"
        ]
    }
}
EOF
