#!/usr/bin/env bash

<% if configure_git %>
git reset --hard
git flow init -f -d
git remote add origin git@git1.digio.es:<%= project_name %>
<% end %>