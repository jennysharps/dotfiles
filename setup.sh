#!/bin/bash
# Codespaces auth config
cp .set_codespaces_token_from_gh_client ~/
(grep -q 'source .set_codespaces_token_from_gh_client' ~/.bashrc || echo 'source ~/.set_codespaces_token_from_gh_client' >> ~/.bashrc) || true
