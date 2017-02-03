# binary_install Cookbook

Provides a highly-opinionated way to handle installations of binary software in
a platform independent way.

### Platforms

- Ubuntu
- CentOS
- Windows

### Cookbooks

- `windows` - binary_install needs windows to handle windows dependencies.

## Attributes

### binary_install::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['binary_install']['default_directory']</tt></td>
    <td>String</td>
    <td>the directory to install software if not specified</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### binary_install::default

Just include `binary_install` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[binary_install]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: Skyler Layne

