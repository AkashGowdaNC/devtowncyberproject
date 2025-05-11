# AutoRecon+ - Advanced Network Scanner

AutoRecon+ is a modular Bash-based tool that automates network reconnaissance using Nmap and generates clean HTML reports with optional email alerts.

## Features

- Modular Nmap scans
- HTML report generation
- Email alerting for critical ports
- Logging and timestamping
- Cron-compatible for automation

## Usage

```bash
bash scan.sh
```

## Requirements

- bash
- nmap
- xsltproc
- mailx (for email alerts)

## Output

- `logs/`: Contains scan logs
- `reports/`: Contains HTML reports

## License

MIT License
