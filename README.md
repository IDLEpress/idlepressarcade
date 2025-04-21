# IDLE Press Arcade

IDLE Press Arcade is a comprehensive documentation and setup guide for arcade cabinet hardware and software, designed for indie game developers wanting to showcase their games in an arcade environment.

## Overview

This repository contains documentation and scripts for setting up arcade cabinets with proper kiosk mode, operator controls, and developer guidelines for building arcade-ready games.

## Features

- **Kiosk Mode Setup**: Complete setup scripts for Ubuntu 24.04 LTS to create a locked-down arcade environment
- **Operator Mode**: Instructions for cabinet maintenance and game updates
- **Developer Guide**: Standards and best practices for developing arcade-ready games
- **Hardware Guidelines**: Information about arcade cabinet hardware and setup

## Requirements

- Ubuntu 24.04 LTS for cabinet setup
- Linux-compatible games

## Getting Started

1. Visit the [documentation website](https://rocket5.ca/idlepressarcade/) for complete instructions
2. Review the developer guide to ensure your game meets arcade cabinet requirements
3. Follow the kiosk setup instructions to configure your arcade cabinet

## Contributing to Documentation

This project uses Jekyll with the Just-the-Docs theme to generate its documentation website. Here's how to contribute to the documentation:

### Prerequisites

- Git
- Ruby (see `.ruby-version` for the required version)
- Jekyll
- VS Code (recommended) or any text editor

### Setting Up Local Development

1. Clone the repository:
   ```bash
   git clone https://github.com/rocket5tim/idlepressarcade.git
   cd idlepressarcade
   ```

2. Install Ruby dependencies:
   ```bash
   gem install bundler
   bundle install
   ```

3. Start the local development server:
   ```bash
   bundle exec jekyll serve
   ```
   
4. Open your browser and visit `http://localhost:4000/idlepressarcade/` to preview the site.

### Editing Documentation

1. Documentation files are located in the `docs/` directory as Markdown (`.md`) files.
2. Use VS Code or your preferred text editor to edit these files.
3. Follow the existing formatting style for consistency.
4. You can preview changes in real-time through your local development server.

### Adding New Pages

1. Create a new Markdown (`.md`) file in the `docs/` directory.
2. Add YAML front matter at the top of the new file:
   ```yaml
   ---
   layout: default
   title: Your Page Title
   nav_order: 4  # Adjust the number to control navigation order
   ---
   ```
3. Add your content below the front matter using Markdown.

### Submitting Changes

1. Stage your changes:
   ```bash
   git add docs/your-edited-file.md
   ```

2. Commit with a meaningful message:
   ```bash
   git commit -m "Add documentation for XYZ feature"
   ```

3. Push your changes:
   ```bash
   git push origin main
   ```

4. The website will automatically rebuild and deploy from the main branch.

## License

This project is licensed under the terms of the license included in the [LICENSE](LICENSE) file.

## Credits

Developed and maintained by [Rocket 5 Studios](https://rocket5.ca).