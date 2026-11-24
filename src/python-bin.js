import { existsSync } from 'node:fs'
import { homedir } from 'node:os'
import { join } from 'node:path'

/** Prefer the Python that ships with DeepSeek Harness, then the system launcher. */
export function resolvePython() {
  const fromEnv = process.env.DSH_ORANGE_CAT_PYTHON
  if (fromEnv && existsSync(fromEnv)) return fromEnv

  const bundled = join(
    homedir(),
    '.dsh',
    'dsh-runtimes',
    'dsh-primary-runtime',
    'dependencies',
    'python',
    'python.exe',
  )
  if (existsSync(bundled)) return bundled

  return process.platform === 'win32' ? 'py' : 'python3'
}

export function pythonLaunchArgs(python, scriptPath, extraArgs = []) {
  if (process.platform === 'win32' && python === 'py') {
    return ['-3', scriptPath, ...extraArgs]
  }
  return [scriptPath, ...extraArgs]
}
