/*
 Libnetvirt - the network virtualization library
 Copyright (C) 2012  Daniel Turull <danieltt@kth.se>

 Libnetvirt is free software: you can redistribute it and/or modify
 it under the terms of the GNU Lesser General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Libnetvirt is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License
 along with libnetvirt.  If not, see <http://www.gnu.org/licenses/>.

 */

#include "libnetvirt/dummy.h"
#include "python_helper.h"

#define DUMMY_SCRIPT "driver_dummy"

struct dummy_info {
	PyObject *pModule;
} info_dummy;

int dummy_connect(char* addr, int port) {
	return python_call_init(DUMMY_SCRIPT);
}

int dummy_stop(void) {
	return python_stop();
}

int dummy_instantiate_fns(fnsDesc *desc) {
	return python_call_fns("dummy_create_fns", desc);
}
int dummy_remove_fns(fnsDesc *desc) {
	return python_call_fns("dummy_remove_fns", desc);
}
int dummy_modify_fns_add(fnsDesc *desc) {
	return python_call_fns("dummy_modify_fns_add", desc);
}
int dummy_modify_fns_del(fnsDesc *desc) {
	return python_call_fns("dummy_modify_fns_del", desc);
}
int dummy_request_ids(void) {
	return 0;
}
