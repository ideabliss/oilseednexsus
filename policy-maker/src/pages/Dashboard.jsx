import { useState } from 'react'
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, LineChart, Line, PieChart, Pie, Cell } from 'recharts'

export default function Dashboard() {
  const [selectedCrop, setSelectedCrop] = useState('all')
  const [selectedRegion, setSelectedRegion] = useState('national')

  const missionTargets = [
    { metric: 'Production', current: 39.0, target: 69.7, unit: 'MT', progress: 56 },
    { metric: 'Area Coverage', current: 28.5, target: 35.0, unit: 'M Ha', progress: 81 },
    { metric: 'Import Reduction', current: 65, target: 30, unit: '%', progress: 54 },
    { metric: 'Traceability', current: 45, target: 80, unit: '%', progress: 56 }
  ]

  const productionData = [
    { year: '2020-21', soybean: 12.2, mustard: 8.3, groundnut: 10.1, sunflower: 2.8 },
    { year: '2021-22', soybean: 13.5, mustard: 9.1, groundnut: 10.7, sunflower: 3.2 },
    { year: '2022-23', soybean: 14.8, mustard: 10.2, groundnut: 11.4, sunflower: 3.6 },
    { year: '2023-24', soybean: 16.1, mustard: 11.5, groundnut: 12.2, sunflower: 4.1 }
  ]

  const statePerformance = [
    { state: 'Maharashtra', production: 8.5, target: 10.0, status: 'amber' },
    { state: 'Madhya Pradesh', production: 7.2, target: 8.0, status: 'green' },
    { state: 'Rajasthan', production: 6.8, target: 7.5, status: 'green' },
    { state: 'Gujarat', production: 4.2, target: 5.5, status: 'red' },
    { state: 'Karnataka', production: 3.9, target: 4.2, status: 'amber' }
  ]

  const alerts = [
    { type: 'critical', message: 'Gujarat production 23% below target', time: '2 hours ago' },
    { type: 'warning', message: 'Monsoon delay in 5 districts of Maharashtra', time: '4 hours ago' },
    { type: 'info', message: 'New seed hub operational in Rajasthan', time: '1 day ago' },
    { type: 'critical', message: 'Storage capacity 95% in Madhya Pradesh', time: '1 day ago' }
  ]

  return (
    <div className="p-6 bg-gradient-to-br from-gray-50 to-blue-50 min-h-screen">
      {/* Header */}
      <div className="mb-8">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-4xl font-bold bg-gradient-to-r from-green-600 via-blue-600 to-purple-600 bg-clip-text text-transparent mb-2">
              National Oilseed Mission Dashboard
            </h1>
            <p className="text-gray-600 text-lg">Real-time insights for data-driven policy decisions</p>
          </div>
          <div className="flex items-center space-x-4">
            <select 
              value={selectedCrop} 
              onChange={(e) => setSelectedCrop(e.target.value)}
              className="bg-white rounded-xl px-4 py-2 border border-gray-200 shadow-lg"
            >
              <option value="all">All Crops</option>
              <option value="soybean">Soybean</option>
              <option value="mustard">Mustard</option>
              <option value="groundnut">Groundnut</option>
              <option value="sunflower">Sunflower</option>
            </select>
            <div className="bg-white rounded-2xl p-4 shadow-lg border border-gray-100">
              <span className="text-3xl">🇮🇳</span>
            </div>
          </div>
        </div>
      </div>

      {/* Mission Targets */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        {missionTargets.map((target, index) => (
          <div key={index} className="bg-white rounded-3xl shadow-xl p-6 border border-gray-100 hover:shadow-2xl transition-all duration-300">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-bold text-gray-900">{target.metric}</h3>
              <div className={`w-4 h-4 rounded-full ${
                target.progress >= 80 ? 'bg-green-500' : 
                target.progress >= 60 ? 'bg-yellow-500' : 'bg-red-500'
              }`}></div>
            </div>
            <div className="space-y-2">
              <div className="flex justify-between items-center">
                <span className="text-2xl font-bold text-gray-900">{target.current}</span>
                <span className="text-sm text-gray-500">/ {target.target} {target.unit}</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className={`h-2 rounded-full ${
                    target.progress >= 80 ? 'bg-green-500' : 
                    target.progress >= 60 ? 'bg-yellow-500' : 'bg-red-500'
                  }`}
                  style={{ width: `${target.progress}%` }}
                ></div>
              </div>
              <p className="text-sm text-gray-600">{target.progress}% of target achieved</p>
            </div>
          </div>
        ))}
      </div>

      {/* Charts Section */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
        <div className="lg:col-span-2 bg-white rounded-3xl shadow-xl p-6 border border-gray-100">
          <h3 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">📈</span>
            Oilseed Production Trends (MT)
          </h3>
          <ResponsiveContainer width="100%" height={350}>
            <LineChart data={productionData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
              <XAxis dataKey="year" stroke="#6b7280" />
              <YAxis stroke="#6b7280" />
              <Tooltip 
                contentStyle={{ 
                  backgroundColor: '#fff', 
                  border: 'none', 
                  borderRadius: '16px', 
                  boxShadow: '0 20px 25px -5px rgba(0, 0, 0, 0.1)' 
                }} 
              />
              <Line type="monotone" dataKey="soybean" stroke="#10B981" strokeWidth={3} />
              <Line type="monotone" dataKey="mustard" stroke="#F59E0B" strokeWidth={3} />
              <Line type="monotone" dataKey="groundnut" stroke="#3B82F6" strokeWidth={3} />
              <Line type="monotone" dataKey="sunflower" stroke="#8B5CF6" strokeWidth={3} />
            </LineChart>
          </ResponsiveContainer>
        </div>

        <div className="bg-white rounded-3xl shadow-xl p-6 border border-gray-100">
          <h3 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">🚨</span>
            Critical Alerts
          </h3>
          <div className="space-y-4">
            {alerts.map((alert, index) => (
              <div key={index} className={`p-4 rounded-2xl border-l-4 ${
                alert.type === 'critical' ? 'bg-red-50 border-red-500' :
                alert.type === 'warning' ? 'bg-yellow-50 border-yellow-500' :
                'bg-blue-50 border-blue-500'
              }`}>
                <div className="flex items-start justify-between">
                  <div className="flex-1">
                    <p className={`text-sm font-semibold ${
                      alert.type === 'critical' ? 'text-red-800' :
                      alert.type === 'warning' ? 'text-yellow-800' :
                      'text-blue-800'
                    }`}>
                      {alert.message}
                    </p>
                    <p className="text-xs text-gray-500 mt-1">{alert.time}</p>
                  </div>
                  <span className="text-lg">
                    {alert.type === 'critical' ? '🔴' : alert.type === 'warning' ? '🟡' : '🔵'}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* State Performance */}
      <div className="bg-white rounded-3xl shadow-xl p-6 border border-gray-100">
        <div className="flex items-center justify-between mb-6">
          <h3 className="text-xl font-bold text-gray-900 flex items-center">
            <span className="mr-3">🗺️</span>
            State-wise Performance
          </h3>
          <button className="bg-gradient-to-r from-green-500 to-green-600 text-white px-6 py-2 rounded-xl hover:from-green-600 hover:to-green-700 transition-all duration-300 font-semibold shadow-lg">
            View Full Map
          </button>
        </div>
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">State</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Production (MT)</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Target (MT)</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Achievement</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Status</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-100">
              {statePerformance.map((state, index) => (
                <tr key={index} className="hover:bg-gradient-to-r hover:from-blue-50 hover:to-green-50 transition-all duration-200">
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-bold text-gray-900">{state.state}</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{state.production}</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-700">{state.target}</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-bold text-gray-900">
                    {Math.round((state.production / state.target) * 100)}%
                  </td>
                  <td className="px-6 py-4 whitespace-nowrap">
                    <span className={`inline-flex px-3 py-1 text-xs font-bold rounded-full uppercase tracking-wide ${
                      state.status === 'green' ? 'bg-green-100 text-green-800' :
                      state.status === 'amber' ? 'bg-yellow-100 text-yellow-800' :
                      'bg-red-100 text-red-800'
                    }`}>
                      {state.status === 'green' ? '✅ On Track' : 
                       state.status === 'amber' ? '⚠️ Monitor' : '🚨 Behind'}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}