/*
 * Copyright 2018 Konsulko Group
 * Author: Matt Ranostay <matt.ranostay@konsulko.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

#include <glib.h>
#include <stdlib.h>
#include <gio/gio.h>
#include <glib-object.h>

#include <json-c/json.h>

#define AFB_BINDING_VERSION 3
#include <afb/afb-binding.h>

#include "bluetooth-api.h"
#include "bluetooth-common.h"

gchar *get_default_adapter(afb_api_t api)
{
	json_object *response, *query, *val;
	gchar *adapter = NULL;
	int ret;

	query = json_object_new_object();
	json_object_object_add(query, "key", json_object_new_string("default_adapter"));

	ret = afb_api_call_sync(api, "persistence", "read", query, &response, NULL, NULL);
	if (ret < 0)
		goto out;

	if (json_object_object_get_ex(response, "value", &val))
		adapter = g_strdup(json_object_get_string(val));
	json_object_put(response);

out:
	return adapter;
}

int set_default_adapter(afb_api_t api, const char *adapter)
{
	json_object *response, *query;
	int ret;

	query = json_object_new_object();
	json_object_object_add(query, "key", json_object_new_string("default_adapter"));
	json_object_object_add(query, "value", json_object_new_string(adapter));

	ret = afb_api_call_sync(api, "persistence", "update", query, &response, NULL, NULL);
	if (ret < 0) {
		ret = afb_api_call_sync(api, "persistence", "insert", query, &response, NULL, NULL);
		if (ret < 0)
			goto out;
	}

	json_object_put(response);

out:
	return ret;
}

gchar *get_pincode(afb_api_t api)
{
	json_object *response, *query, *val;
	gchar *pincode = NULL;

	query = json_object_new_object();
	json_object_object_add(query, "key", json_object_new_string("pincode"));

	afb_api_call_sync(api, "persistence", "read", query, &response, NULL, NULL);

	if (json_object_object_get_ex(response, "value", &val))
		pincode = g_strdup(json_object_get_string(val));
	else
		pincode = "1234";
	json_object_put(response);

	return pincode;
}

int set_pincode(afb_api_t api, const char *pincode, char **error)
{
	json_object *response, *query;
	int ret;
	gchar *endptr = NULL;
	query = json_object_new_object();
	if (strlen(pincode) > 8 || strlen(pincode) < 4)
	{
		*error = "length of pincode must be between 4 and 8";
		return -1;
	}

	g_ascii_strtoll(pincode, &endptr, 10);
	if (*endptr)
	{
		*error = "pincode must be as digits";
		return -1;
	}
	json_object_object_add(query, "key", json_object_new_string("pincode"));
	json_object_object_add(query, "value", json_object_new_string(pincode));

	ret = afb_api_call_sync(api, "persistence", "update", query, &response, NULL, NULL);
	json_object_put(response);

	return ret;
}