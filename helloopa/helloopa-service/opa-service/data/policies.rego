package opablog

import rego.v1

default allow := false

allow := true if {
    input.group == data.GroupPermissions[input.resource][_]
}