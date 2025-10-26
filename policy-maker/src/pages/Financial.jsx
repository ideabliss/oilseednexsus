import { useState } from 'react'
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, PieChart, Pie, Cell, LineChart, Line } from 'recharts'

export default function Financial() {
  const [selectedScheme, setSelectedScheme] = useState('all')

  const budgetAllocation = [
    { scheme: 'Seed Development', allocated: 500, utilized: 420, percentage: 84 },
    { scheme: 'Infrastructure', allocated: 800, utilized: 680, percentage: 85 },
    { scheme: 'Technology Support', allocated: 300, utilized: 240, percentage: 80 },
    { scheme: 'Farmer Training', allocated: 200, utilized: 180, percentage: 90 },
    { scheme: 'Quality Testing', allocated: 150, utilized: 135, percentage: 90 }
  ]

  const disbursementData = [
    { month: 'Apr', target: 100, actual: 85 },
    { month: 'May', target: 120, actual: 110 },
    { month: 'Jun', target: 150, actual: 140 },
    { month: 'Jul', target: 180, actual: 175 },
    { month: 'Aug', target: 200, actual: 190 },
    { month: 'Sep', target: 220, actual: 200 }
  ]

  const stateWiseSpending = [
    { state: 'Maharashtra', amount: 245, color: '#10B981' },
    { state: 'Madhya Pradesh', amount: 198, color: '#3B82F6' },
    { state: 'Rajasthan', amount: 167, color: '#8B5CF6' },
    { state: 'Gujarat', amount: 134, color: '#F59E0B' },
    { state: 'Others', amount: 256, color: '#EF4444' }
  ]

  const subsidyPrograms = [
    { 
      program: 'Seed Subsidy Program',
      budget: '₹500 Cr',
      disbursed: '₹420 Cr',
      beneficiaries: 125000,
      status: 'On Track'
    },
    { 
      program: 'Storage Infrastructure',
      budget: '₹800 Cr',
      disbursed: '₹680 Cr',
      beneficiaries: 2500,
      status: 'On Track'
    },
    { 
      program: 'Technology Adoption',
      budget: '₹300 Cr',
      disbursed: '₹240 Cr',
      beneficiaries: 85000,
      status: 'Behind'
    },
    { 
      program: 'Crop Insurance',
      budget: '₹400 Cr',
      disbursed: '₹380 Cr',
      beneficiaries: 180000,
      status: 'Ahead'
    }
  ]

  const financialKPIs = [
    { metric: 'Total Budget', value: '₹2,500 Cr', change: '+15%', color: 'blue' },
    { metric: 'Utilized Amount', value: '₹2,100 Cr', change: '+12%', color: 'green' },
    { metric: 'Pending Approvals', value: '₹150 Cr', change: '-8%', color: 'orange' },
    { metric: 'Beneficiaries', value: '3.2L', change: '+25%', color: 'purple' }
  ]

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="bg-gradient-to-r from-yellow-600 to-green-600 rounded-2xl p-6 text-white">
        <h1 className="text-3xl font-bold mb-2">Financial Tracking & Budget Management</h1>
        <p className="text-white/90">Monitor scheme disbursements, subsidy utilization, and financial performance</p>
      </div>

      {/* Financial KPIs */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {financialKPIs.map((kpi, index) => (
          <div key={index} className="bg-white rounded-3xl shadow-xl p-6 border border-gray-100 hover:shadow-2xl transition-all duration-300">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-bold text-gray-900">{kpi.metric}</h3>
              <div className={`w-4 h-4 rounded-full bg-${kpi.color}-500`}></div>
            </div>
            <div className="space-y-2">
              <p className="text-3xl font-bold text-gray-900">{kpi.value}</p>
              <div className="flex items-center">
                <span className={`text-sm font-bold px-2 py-1 rounded-full ${
                  kpi.change.startsWith('+') ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                }`}>
                  {kpi.change}
                </span>
                <span className="text-sm text-gray-500 ml-2">vs last year</span>
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* Budget Allocation & Disbursement */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
          <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">💰</span>
            Budget Utilization by Scheme
          </h2>
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={budgetAllocation}>
              <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
              <XAxis dataKey="scheme" stroke="#6b7280" angle={-45} textAnchor="end" height={80} />
              <YAxis stroke="#6b7280" />
              <Tooltip />
              <Bar dataKey="allocated" fill="#E5E7EB" name="Allocated" />
              <Bar dataKey="utilized" fill="#10B981" name="Utilized" />
            </BarChart>
          </ResponsiveContainer>
        </div>

        <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
          <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">📈</span>
            Monthly Disbursement Trend
          </h2>
          <ResponsiveContainer width="100%" height={300}>
            <LineChart data={disbursementData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
              <XAxis dataKey="month" stroke="#6b7280" />
              <YAxis stroke="#6b7280" />
              <Tooltip />
              <Line type="monotone" dataKey="target" stroke="#EF4444" strokeWidth={3} name="Target" />
              <Line type="monotone" dataKey="actual" stroke="#10B981" strokeWidth={3} name="Actual" />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </div>

      {/* State-wise Spending & Subsidy Programs */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
          <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">🗺️</span>
            State-wise Budget Distribution
          </h2>
          <ResponsiveContainer width="100%" height={300}>
            <PieChart>
              <Pie
                data={stateWiseSpending}
                cx="50%"
                cy="50%"
                innerRadius={60}
                outerRadius={120}
                paddingAngle={5}
                dataKey="amount"
              >
                {stateWiseSpending.map((entry, index) => (
                  <Cell key={`cell-${index}`} fill={entry.color} />
                ))}
              </Pie>
              <Tooltip />
            </PieChart>
          </ResponsiveContainer>
          <div className="mt-4 space-y-2">
            {stateWiseSpending.map((state, index) => (
              <div key={index} className="flex items-center justify-between">
                <div className="flex items-center">
                  <div className="w-3 h-3 rounded-full mr-2" style={{ backgroundColor: state.color }}></div>
                  <span className="text-sm text-gray-700">{state.state}</span>
                </div>
                <span className="text-sm font-semibold text-gray-900">₹{state.amount} Cr</span>
              </div>
            ))}
          </div>
        </div>

        <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
          <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">🎯</span>
            Subsidy Program Performance
          </h2>
          <div className="space-y-4">
            {subsidyPrograms.map((program, index) => (
              <div key={index} className="bg-gray-50 rounded-xl p-4">
                <div className="flex items-center justify-between mb-2">
                  <h3 className="font-semibold text-gray-900">{program.program}</h3>
                  <span className={`px-3 py-1 rounded-full text-xs font-bold ${
                    program.status === 'On Track' ? 'bg-green-100 text-green-800' :
                    program.status === 'Ahead' ? 'bg-blue-100 text-blue-800' :
                    'bg-red-100 text-red-800'
                  }`}>
                    {program.status}
                  </span>
                </div>
                <div className="grid grid-cols-3 gap-4 text-sm">
                  <div>
                    <p className="text-gray-600">Budget</p>
                    <p className="font-bold text-gray-900">{program.budget}</p>
                  </div>
                  <div>
                    <p className="text-gray-600">Disbursed</p>
                    <p className="font-bold text-gray-900">{program.disbursed}</p>
                  </div>
                  <div>
                    <p className="text-gray-600">Beneficiaries</p>
                    <p className="font-bold text-gray-900">{program.beneficiaries.toLocaleString()}</p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Detailed Financial Table */}
      <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-xl font-bold text-gray-900 flex items-center">
            <span className="mr-3">📊</span>
            Detailed Budget Analysis
          </h2>
          <div className="flex space-x-2">
            <select 
              value={selectedScheme} 
              onChange={(e) => setSelectedScheme(e.target.value)}
              className="bg-gray-50 rounded-xl px-4 py-2 border border-gray-200"
            >
              <option value="all">All Schemes</option>
              <option value="seed">Seed Development</option>
              <option value="infrastructure">Infrastructure</option>
              <option value="technology">Technology</option>
            </select>
            <button className="bg-gradient-to-r from-yellow-500 to-green-500 text-white px-6 py-2 rounded-xl hover:from-yellow-600 hover:to-green-600 transition-all duration-300 font-semibold">
              Export Report
            </button>
          </div>
        </div>
        
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Scheme</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Allocated (Cr)</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Utilized (Cr)</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Utilization %</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Pending (Cr)</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Status</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-100">
              {budgetAllocation.map((scheme, index) => (
                <tr key={index} className="hover:bg-gradient-to-r hover:from-yellow-50 hover:to-green-50 transition-all duration-200">
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-bold text-gray-900">{scheme.scheme}</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">₹{scheme.allocated}</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-green-600">₹{scheme.utilized}</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-bold text-gray-900">{scheme.percentage}%</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-orange-600">₹{scheme.allocated - scheme.utilized}</td>
                  <td className="px-6 py-4 whitespace-nowrap">
                    <span className={`inline-flex px-3 py-1 text-xs font-bold rounded-full uppercase tracking-wide ${
                      scheme.percentage >= 85 ? 'bg-green-100 text-green-800' :
                      scheme.percentage >= 75 ? 'bg-yellow-100 text-yellow-800' :
                      'bg-red-100 text-red-800'
                    }`}>
                      {scheme.percentage >= 85 ? '✅ Excellent' : 
                       scheme.percentage >= 75 ? '⚠️ Good' : '🚨 Needs Attention'}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {/* Financial Alerts */}
      <div className="bg-gradient-to-br from-yellow-50 to-orange-50 rounded-2xl p-6 border border-yellow-200">
        <h2 className="text-xl font-bold text-yellow-900 mb-6 flex items-center">
          <span className="mr-3">⚠️</span>
          Financial Alerts & Recommendations
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="bg-white rounded-xl p-4">
            <h3 className="font-semibold text-gray-900 mb-2">🚨 Budget Alert</h3>
            <p className="text-sm text-gray-600">
              Technology Support scheme utilization below 80%. Review and expedite approvals.
            </p>
          </div>
          <div className="bg-white rounded-xl p-4">
            <h3 className="font-semibold text-gray-900 mb-2">💡 Recommendation</h3>
            <p className="text-sm text-gray-600">
              Reallocate ₹50 Cr from under-utilized schemes to high-demand infrastructure projects.
            </p>
          </div>
          <div className="bg-white rounded-xl p-4">
            <h3 className="font-semibold text-gray-900 mb-2">📈 Opportunity</h3>
            <p className="text-sm text-gray-600">
              Gujarat showing high demand for seed subsidies. Consider additional allocation for next quarter.
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}