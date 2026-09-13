import { resolve } from 'node:path';
import { createBuilder, EndpointProperty } from './.aspire/modules/aspire.mjs';

const builder = await createBuilder();
const root = import.meta.dirname;
const config = resolve(process.env.SDLC_WORKSPACE_CONFIG ?? resolve(root, 'workspace.json'));
const database = await builder.addDuckDB('annotations', {
  databasePath: resolve(root, '_build/state'), databaseFileName: 'notes.duckdb',
});
const notes = await builder.addPythonApp('notes', './tools', 'docs/annotations/service.py')
  .withUv({ install: false })
  .withReference(database)
  .withEnvironment('SDLC_NOTES_DATABASE', resolve(root, '_build/state/notes.duckdb'))
  .withHttpEndpoint({ name: 'http', env: 'PORT' })
  .withHttpHealthCheck({ endpointName: 'http', path: '/notes' });
const api = await builder.addPythonApp('review-api', './tools', 'review/api/service.py')
  .withUv({ install: false })
  .withEnvironment('SDLC_WORKSPACE_CONFIG', config)
  .withHttpEndpoint({ name: 'http', env: 'PORT' })
  .withHttpHealthCheck({ endpointName: 'http', path: '/api/health' });
const docs = await builder.addPythonApp('docs', './tools', 'docs/serve.py')
  .withUv({ install: false })
  .withEnvironment('SDLC_WORKSPACE_CONFIG', config)
  .withHttpEndpoint({ name: 'http', env: 'PORT' })
  .withHttpHealthCheck({ endpointName: 'http', path: '/' });
const domain = process.env.SDLC_DOMAIN ?? 'sdlc.localhost';
const port = process.env.SDLC_PORT ?? '8870';
const review = await builder.addExecutable('review-web', 'npm', './tools/review/web', ['run', 'dev'])
  .withEnvironment('SDLC_DOMAIN', domain)
  .withEnvironment('SDLC_PORT', port)
  .withHttpEndpoint({ name: 'http', env: 'PORT' })
  .withHttpHealthCheck({ endpointName: 'http', path: '/' });
await builder.addPythonApp('gateway', './tools', 'gateway/service.py')
  .withUv({ install: false })
  .withEnvironment('NOTES_URL', notes.getEndpoint('http').property(EndpointProperty.Url))
  .withEnvironment('REVIEW_API_URL', api.getEndpoint('http').property(EndpointProperty.Url))
  .withEnvironment('REVIEW_WEB_URL', review.getEndpoint('http').property(EndpointProperty.Url))
  .withEnvironment('DOCS_URL', docs.getEndpoint('http').property(EndpointProperty.Url))
  .withEnvironment('SDLC_DOMAIN', domain)
  .withHttpEndpoint({ name: 'http', port: Number(port), env: 'PORT' })
  .withHttpHealthCheck({ endpointName: 'http', path: '/health' })
  .waitFor(notes).waitFor(api).waitFor(docs).waitFor(review);
await builder.build().run();
