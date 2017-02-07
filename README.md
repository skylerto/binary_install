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
    <td><tt>['binary_install']['default_directory']['windows']</tt></td>
    <td>String</td>
    <td>the default platform directory to install software</td>
    <td><tt>C:</tt></td>
  </tr>
  <tr>
    <td><tt>['binary_install']['default_directory']['linux']</tt></td>
    <td>String</td>
    <td>the default platform directory to install software</td>
    <td><tt>/etc</tt></td>
  </tr>
  <tr>
    <td><tt>['binary_install']['strip_directory']</tt></td>
    <td>Boolean</td>
    <td>extract the contents of an archived folder into the directory</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: Skyler Layne

