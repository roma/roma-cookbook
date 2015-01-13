# roma-cookbook

Installs ROMA with Chef.  
About booting ROMA, pleaes read ROMA website.  
[http://roma-kvs.org](http://roma-kvs.org)

## Supported Platforms

The following platforms are supported:
* centos
* ubuntu

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['roma']['gem_path']</tt></td>
    <td>String</td>
    <td>Select gems which you use</td>
    <td><tt>/opt/rbenv/shims/gem</tt></td>
  </tr>
  <tr>
    <td><tt>['roma']['target_dir']</tt></td>
    <td>String</td>
    <td>Target dirctory of ROMA</td>
    <td><tt>/opt/roma</tt></td>
  </tr>
  <tr>
    <td><tt>['roma']['target_user']</tt></td>
    <td>String</td>
    <td>Set up user of ROMA directory</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['roma']['target_group']</tt></td>
    <td>String</td>
    <td>Set up group of ROMA directory</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['roma']['app_name']</tt></td>
    <td>String</td>
    <td>Application name which you use by ROMA</td>
    <td><tt>roma_app</tt></td>
  </tr>
  <tr>
    <td><tt>['roma']['version']</tt></td>
    <td>String</td>
    <td>ROMA version</td>
    <td><tt>1.0.0</tt></td>
  </tr>
  <tr>
    <td><tt>['roma']['source_uri']</tt></td>
    <td>String</td>
    <td>Source URL of ROMA</td>
    <td><tt>https://github.com/roma/roma/archive/v1.0.0.tar.gz</tt></td>
  </tr>
  <tr>
    <td><tt>['roma']['tc_ruby']['target_user']</tt></td>
    <td>String</td>
    <td>Set up user of tokyocabinet-ruby directory</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['roma']['tc_ruby']['version']</tt></td>
    <td>String</td>
    <td>Version of tokyocabinet-ruby</td>
    <td><tt>1.31.a</tt></td>
  </tr>
  <tr>
    <td><tt>['roma']['tc_ruby']['source_uri']</tt></td>
    <td>String</td>
    <td>Source URL of tokyocabinet-ruby</td>
    <td><tt>https://github.com/roma/tokyocabinet-ruby/archive/v1.31.a.tar.gz</tt></td>
  </tr>
  <tr>
    <td><tt>['roma']['tc_ruby']['gem_option']</tt></td>
    <td>String</td>
    <td>The opsion which you use when you install tokyocabinet-ruby</td>
    <td><tt>-- --with-tokyocabinet-dir=/usr/local/libexec</tt></td>
  </tr>
</table>

## Usage

This cookbook require `ruby` for ROMA. If `ruby` is not installed:

```bash
berks vender
```
Include `rbenv` in your recipe:

```json
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "rbenv::rbenv_vars"

rbenv_ruby "2.1.2" do
  ruby_version "2.1.2"
  global true
end
```

This cookbook primarily installs ROMA main unit packages. But it also need `eventomachine` gems.

Include `roma` and `eventmachine` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[roma::default]",
    "recipe[roma::eventmachine]"
  ]
}
```

To use Tokyo Cabinet, include `tc_ruby` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[roma::tc_ruby]",
    "recipe[roma::default]",
    "recipe[roma::eventmachine]"
  ]
}
```

`tc_ruby` needs `Tokyo Cabinet`. If you install `Tokyo Cabinet`, it can also be installed by Chef.
Link: [tokyo-cabinet-cookbook](https://github.com/roma/tokyo-cabinet-cookbook).

```bash
berks vender
```

To install tokyo-cabinet:

```json
{
  "run_list": [
    "recipe[tokyo-cabinet]"
  ]
}
```


## Authors

Author:: Rui Bando (bando.rui@gmail.com)
