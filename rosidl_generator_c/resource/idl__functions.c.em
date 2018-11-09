// generated from rosidl_generator_c/resource/idl__functions.h.em
// generated code does not contain a copyright notice
@
@#######################################################################
@# EmPy template for generating <idl>__functions.h files
@#
@# Context:
@#  - package_name (string)
@#  - interface_path (Path relative to the directory named after the package)
@#  - interfaces (list of interfaces, either Messages or Services)
@#  - get_header_filename_from_msg_name (function)
@#######################################################################
@{
include_parts = [package_name] + list(interface_path.parents[0].parts) + \
    [get_header_filename_from_msg_name(interface_path.stem)]
include_base = '/'.join(include_parts)
}@
#include "@(include_base)__functions.h"

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
@
@#######################################################################
@# Handle message
@#######################################################################
@{
from rosidl_parser.definition import Message
}@
@[for message in content.get_elements_of_type(Message)]@

@{
TEMPLATE(
    'msg__functions.c.em',
    package_name=package_name, interface_path=interface_path,
    get_header_filename_from_msg_name=get_header_filename_from_msg_name,
    message=message)
}@
@[end for]@
@
@#######################################################################
@# Handle service
@#######################################################################
@{
from rosidl_parser.definition import Service
}@
@[for service in content.get_elements_of_type(Service)]@
@{

TEMPLATE(
    'msg__functions.c.em',
    package_name=package_name, interface_path=interface_path,
    get_header_filename_from_msg_name=get_header_filename_from_msg_name,
    message=service.request_message)
}@

@{
TEMPLATE(
    'msg__functions.c.em',
    package_name=package_name, interface_path=interface_path,
    get_header_filename_from_msg_name=get_header_filename_from_msg_name,
    message=service.response_message)
}@
@[end for]@